#pragma once

#include <QObject>
#include <QAbstractListModel>
#include <vector>

class MyModel : public QAbstractListModel
{
    Q_OBJECT
public:
    MyModel(QObject * parent = nullptr)
    {
        addData("Sasha", "1234");
        addData("Masha", "1234");
    }

    int rowCount(const QModelIndex &parent) const;
    QVariant data(const QModelIndex &index, int role) const;
    QHash<int, QByteArray> roleNames() const;
    bool setData(const QModelIndex &index, const QVariant &value, int role);
    Qt::ItemFlags flags(const QModelIndex &index) const;

    Q_INVOKABLE void addData(const QString& name, const QString& phone_number);
private:

    struct myData {
        QString name;
        QString phoneNumber;
    };

    enum Roles {
        name_role = Qt::UserRole + 1,
        phone_role
    };

    std::vector<myData> m_modelData;
};

