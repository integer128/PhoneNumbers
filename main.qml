import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("MyApplication")

    StackView {
        id: stackview
        anchors.fill: parent
        initialItem: "mainView.qml"
    }
}
