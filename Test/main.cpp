#include <QCoreApplication>
#include <iostream>
#include <cmath>
#include "enttecdmxusb.h"

#define DMXDEVICE "/dev/ttyUSB0"
#define NUM_CHANNELS 512 // Nombre de canaux DMX

using namespace std;

// Définition des canaux DMX pour les couleurs
#define CHANNEL_RED   1
#define CHANNEL_GREEN 2
#define CHANNEL_BLUE  3

// Définition des paramètres pour les transitions de couleur
#define TRANSITION_SPEED 0.05 // Vitesse de transition de couleur (en radians par itération)

// Fonction pour régler les canaux DMX pour une couleur spécifique
void setRGBColor(EnttecDMXUSB &interfaceDMX, int r, int g, int b) {
    interfaceDMX.SetCanalDMX(CHANNEL_RED, r);
    interfaceDMX.SetCanalDMX(CHANNEL_GREEN, g);
    interfaceDMX.SetCanalDMX(CHANNEL_BLUE, b);
}

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    EnttecDMXUSB interfaceDMX(DMX_USB_PRO, DMXDEVICE);
    string configurationDMX;

    if(interfaceDMX.IsAvailable())
    {
        configurationDMX = interfaceDMX.GetConfiguration();
        cout << "Interface " << interfaceDMX.GetNomInterface() << " détectée" << endl << configurationDMX << endl;

        double angle = 0.0; // Angle pour les transitions de couleur

        interfaceDMX.ResetCanauxDMX();
        interfaceDMX.SendDMX();

        while(1)
        {
            // Calcul des valeurs RVB en fonction de l'angle
            int r = static_cast<int>(127.0 + 127.0 * sin(angle));
            int g = static_cast<int>(127.0 + 127.0 * sin(angle + 2.0 * M_PI / 3.0));
            int b = static_cast<int>(127.0 + 127.0 * sin(angle + 4.0 * M_PI / 3.0));

            // Régler les canaux DMX pour la couleur calculée
            setRGBColor(interfaceDMX, r, g, b);

            // Incrémenter l'angle pour les transitions de couleur
            angle += TRANSITION_SPEED;

            // Limiter l'angle entre 0 et 2*PI
            if (angle > 2.0 * M_PI)
                angle -= 2.0 * M_PI;

            interfaceDMX.SendDMX();
            usleep(1000); // Délai entre chaque mise à jour des LED (en microsecondes)
        }
    }
    else
        cout << "Interface non détectée !" << endl;

    return a.exec();
}
