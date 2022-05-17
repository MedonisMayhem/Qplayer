import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.12

Window {
    id: window
    minimumHeight: 400
    minimumWidth: 300
    visible: true
    title: qsTr("QPlayer")


    function setValue()
    {
        control.value+= 0.01;
    }

    ColumnLayout {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        ColumnLayout {
            anchors.horizontalCenter: parent.horizontalCenter

            Image {
                anchors.horizontalCenter: parent.horizontalCenter
                width: window.width * 0.5; height: window.hight * 0.5
                source: "qrc:/ali.jpg"
                sourceSize.width: window.width * 0.5; sourceSize.height: window.hight * 0.5;
            }

            Label {
                text: "Track Name"
                font.pixelSize: window.width * 0.07
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Label {
                text: "Music group"
                font.pixelSize: window.width * 0.05
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        GridLayout {
            id: buttonGroup
            anchors.horizontalCenter: parent.horizontalCenter
            columns: 5
            Label {
                text: "▶️"
                font.pixelSize: window.width * 0.1
            }

            Label {
                text: "⏸️"
                font.pixelSize: window.width * 0.1
            }

            Label {
                text: "⏹"
                font.pixelSize: window.width * 0.1
            }

            Label {
                text: "⏪️"
                font.pixelSize: window.width * 0.1
            }

            Label {
                text: "⏩️"
                font.pixelSize: window.width * 0.1
            }
        }

        ProgressBar {
            id: control
            padding: 2
            from: 0
            to: 10

            background: Rectangle {
                    implicitWidth: buttonGroup.width
                    implicitHeight: 6
                    color: "#000000"
                    radius: 3
                }

            contentItem: Item {
                    implicitWidth: buttonGroup.width
                    implicitHeight: 4

                    Rectangle {
                        width: control.visualPosition * parent.width
                        height: parent.height
                        radius: 2
                        color: "#3f2aff"
                    }
                }
            Timer {
                interval: 100
                repeat: true
                running: true
                onTriggered: {
                    setValue();
                }
            }
        }
    }
}
