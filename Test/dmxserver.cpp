#include "dmxserver.h"

DMXServer::DMXServer(QObject *parent)
    : QTcpServer(parent)
{
    if (!listen(QHostAddress::Any, 1234)) { // Remplacez 1234 par le numéro de port de votre serveur
        qDebug() << "Erreur : impossible de démarrer le serveur.";
        return;
    }
}

DMXServer::~DMXServer()
{
    clientSocket->close();
}

void DMXServer::incomingConnection(qintptr socketDescriptor)
{
    clientSocket = new QTcpSocket(this);
    clientSocket->setSocketDescriptor(socketDescriptor);

    in.setDevice(clientSocket);
    out.setDevice(clientSocket);
    out.setVersion(QDataStream::Qt_5_0);

    // Connexion des signaux et des slots pour lire et écrire des données
    connect(clientSocket, &QTcpSocket::readyRead, this, &DMXServer::readData);
    connect(clientSocket, &QTcpSocket::disconnected, clientSocket, &QTcpSocket::deleteLater);
}

void DMXServer::readData()
{
    quint16 blockSize = 0;
    in >> blockSize;

    QByteArray data;
    in >> data;

    // Traiter les données reçues
}
