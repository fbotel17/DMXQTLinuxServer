#ifndef DMXSERVER_H
#define DMXSERVER_H

#include <QTcpServer>
#include <QTcpSocket>
#include <QDataStream>

class DMXServer : public QTcpServer
{
    Q_OBJECT

public:
    DMXServer(QObject *parent = nullptr);
    ~DMXServer();

protected:
    void incomingConnection(qintptr socketDescriptor);
    void readData();

private:
    QTcpSocket *clientSocket;
    QDataStream in;
    QDataStream out;
};

#endif // DMXSERVER_H
