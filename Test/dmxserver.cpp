#include "dmxserver.h"

#include "enttecdmxusb.h"

#define NUM_CHANNELS 512 // Nombre de canaux DMX
#define DMXDEVICE "/dev/ttyUSB0"

// Constructeur de la classe DMXServer
DMXServer::DMXServer(QObject *parent)
    : QTcpServer(parent)
{
    // Écouter les connexions entrantes sur le port 1234
    if (!listen(QHostAddress::Any, 12345)) {
        qDebug() << "Erreur : impossible de démarrer le serveur.";
        return;
    }
    qDebug() << "Serveur démarré sur le port 12345.";
}

// Destructeur de la classe DMXServer
DMXServer::~DMXServer()
{
    // Fermer le socket du client
    clientSocket->close();
}

// Cette méthode est appelée lorsqu'un nouveau client se connecte au serveur
void DMXServer::incomingConnection(qintptr socketDescriptor)
{
    // Créer un nouveau socket pour le client
    clientSocket = new QTcpSocket(this);

    // Définir le descripteur de socket pour le nouveau client
    clientSocket->setSocketDescriptor(socketDescriptor);

    // Configurer les flux d'entrée et de sortie pour le socket du client
    in.setDevice(clientSocket);
    out.setDevice(clientSocket);
    out.setVersion(QDataStream::Qt_5_0);

    // Connecter les signaux et les slots pour lire et écrire des données
    connect(clientSocket, &QTcpSocket::readyRead, this, &DMXServer::readData);
    connect(clientSocket, &QTcpSocket::disconnected, clientSocket, &QTcpSocket::deleteLater);

    qDebug() << "Nouveau client connecté :" << clientSocket->peerAddress().toString() << ":" << clientSocket->peerPort();
}

// Cette méthode est appelée lorsque des données sont disponibles pour être lues à partir du socket du client


// Cette méthode est appelée lorsque des données sont disponibles pour être lues à partir du socket du client
void DMXServer::readData()
{
    QByteArray data = clientSocket->readAll();
    qDebug() << "Données reçues :" << data.toHex(' ');

    // Extraire les valeurs des canaux DMX de la trame reçue
    QVector<int> dmxValues;
    for (int i = 0; i < NUM_CHANNELS && i < data.size(); ++i) {
        dmxValues.append(static_cast<int>(data[i])); // Convertir en int
    }

    // Régler les canaux DMX sur l'interface Enttec DMX USB
    EnttecDMXUSB interfaceDMX(DMX_USB_PRO, DMXDEVICE);
    if (interfaceDMX.IsAvailable()) {
        for (int i = 0; i < dmxValues.size(); ++i) {
            interfaceDMX.SetCanalDMX(i + 1, dmxValues[i]);
        }
        interfaceDMX.SendDMX();
    }
}







