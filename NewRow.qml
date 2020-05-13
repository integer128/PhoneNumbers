import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12

Page {
    header: Pane {
        height: 40
        background: Rectangle {
            anchors.fill: parent
            color: Material.color(Material.Red)

            Label {
                anchors.centerIn: parent
                text: "Add new phone number"
            }

            Button {
                height: 40
                anchors.left: parent.left
                flat: true

                Image {
                    anchors.centerIn: parent
                    source: "qrc:/mdi_keyboard_backspace.png"
                }

                onClicked: {
                    stackview.pop()
                }
            }
        }
    }

    ColumnLayout {
        width: parent.width
        spacing: 5

        TextField {
            id: name_
            Layout.alignment: Qt.AlignHCenter
            width: 300
            placeholderText: "Enter name"
        }

        TextField {
            id: phone_
            Layout.alignment: Qt.AlignHCenter
            width: 300
            placeholderText: "Enter phone"
        }

        Button {
            Layout.alignment: Qt.AlignHCenter
            width: 300
            text: "ДОБАВИТЬ"

            onClicked: {
                mymodel.addData(name_.text.toString(), phone_.text.toString())
                stackview.pop()
            }
        }
    }
}
