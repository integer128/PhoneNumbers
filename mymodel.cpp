#include "mymodel.h"

int MyModel::rowCount(const QModelIndex &parent) const
{
    if(parent.isValid())
    {
        return 0;
    }
    return m_modelData.size();
}

QVariant MyModel::data(const QModelIndex &index, int role) const
{
    if(!index.isValid())
    {
        return QVariant {};
    }

    const myData &data_ = m_modelData.at(index.row());

    switch (role) {
    case name_role: return data_.name;
    case phone_role: return data_.phoneNumber;
    default: return {};
    }
}

QHash<int, QByteArray> MyModel::roleNames() const
{
    QHash<int,QByteArray> names;
    names[name_role] = "name";
    names[phone_role] = "phone";
    return names;
}

bool MyModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if(!index.isValid())
    {
        return false;
    }

    switch (role) {
    case name_role:  m_modelData[index.row()].name        = value.toString(); break;
    case phone_role: m_modelData[index.row()].phoneNumber = value.toString(); break;
    default:    return false;
    }

    emit dataChanged(index, index, QVector<int>() << role);

    return true;
}

Qt::ItemFlags MyModel::flags(const QModelIndex &index) const
{
    if(!index.isValid())
    {
        return Qt::ItemIsEnabled;
    }
    return QAbstractListModel::flags(index) | Qt::ItemIsEditable;
}

void MyModel::addData(const QString &name, const QString &phone_number)
{
    myData data;
    data.name = name;
    data.phoneNumber = phone_number;

    emit beginInsertRows(QModelIndex{}, m_modelData.size(), m_modelData.size());

    m_modelData.push_back(data);

    emit endInsertRows();
}
