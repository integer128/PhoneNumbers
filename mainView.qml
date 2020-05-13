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
                text: "Phone Numbers"
            }

            Button {
                height: 40
                anchors.right: parent.right
                flat: true

                Image {
                    anchors.centerIn: parent
                    source: "qrc:/mdi_add_circle_outline.png"
                }

                onClicked: {
                    stackview.push("NewRow.qml")
                }
            }
        }
    }

    ScrollView {
        anchors.fill: parent

        ListView {
            width: parent.width
            model: mymodel
            delegate: ItemDelegate {
                Layout.alignment: Qt.AlignLeft
                width: parent.width
                height: 50

                RowLayout {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    width: parent.width - 5

                    TextField {
                        id: label
                        Layout.alignment: Qt.AlignVCenter
                        text: name
                        leftPadding: 5
                        enabled: false

                        background: Item {
                            implicitWidth: 200
                            implicitHeight: 40
                        }
                    }

                    TextField {
                        id: label2
                        Layout.alignment: Qt.AlignVCenter
                        text: phone
                        leftPadding: 5
                        enabled: false

                        background: Item {
                            implicitWidth: 200
                            implicitHeight: 40
                        }
                    }

                    Button {
                        Layout.alignment: Qt.AlignRight
                        flat: true

                        Image {
                            anchors.centerIn: parent
                            source: "qrc:/mdi_edit.png"
                        }

                        onClicked: {
                            if(label.enabled) {
                                label.enabled = false
                                label2.enabled = false
                                name = label.text.toString()
                                phone = label2.text.toString()
                            }
                            else {
                                label.enabled = true
                                label2.enabled = true
                            }
                        }
                    }
                }
            }
        }
    }
}
