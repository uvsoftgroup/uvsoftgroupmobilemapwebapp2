/* Copyright 2017 Esri
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */


import QtQuick 2.7
import QtQuick.Controls 2.1
import ArcGIS.AppFramework 1.0
import ArcGIS.AppFramework.Controls 1.0
import "./MyButton"
import QtQuick.Dialogs 1.1
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.1
import ArcGIS.AppFramework 1.0
import ArcGIS.AppFramework.Controls 1.0
import Esri.ArcGISRuntime 100.1

App {
    id: app
    width: 400
    height: 640
    Loader {
       id:loder
       anchors.fill: parent
     }

    Item {
        width: 200
        height: 200
       }

    Rectangle {
            id: bgr_rect
            width: app.width
            height: app.height
            color: "grey"
            opacity: 0.5
            anchors.centerIn: parent
        Rectangle {
            id: argument1_rect
            anchors.left: bgr_rect.left
            width: 160
            height: 50
            anchors.top: bgr_rect.top
            anchors.topMargin: 10
            anchors.leftMargin: 10
            anchors.rightMargin: 10
           // color: "blue"
            TextInput {
                id: argument1
                anchors.left: argument1_rect.left
                width: 160
                anchors.top: argument1_rect.top
                anchors.topMargin: 10
                anchors.leftMargin: 10
                anchors.rightMargin: 10
                text: ""
                font.pointSize: 18
                 color: "black"
            }
        }

        Rectangle {
            id: argument2_rect
            anchors.right: bgr_rect.right
            width: 160
            height: 50
            anchors.top: bgr_rect.top
            anchors.topMargin: 10
            anchors.leftMargin: 10
            anchors.rightMargin: 10
        //  color: "red"
            TextInput {
                id: argument2
                anchors.left: argument2_rect.left
                width: 160
                anchors.top: argument2_rect.top
                anchors.topMargin: 10
                anchors.leftMargin: 10
                anchors.rightMargin: 10
                text: ""
                color: "black"
                font.pointSize: 18
            }
        }
        Rectangle {
            id: result_rect
            width: 160
            height: 50
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: argument1_rect.bottom
            anchors.topMargin: 10
        //  color: "green"
            Text {
                id: result
                anchors.centerIn: parent
                elide: Text.ElideRight
                width: 160
                text: ""
                font.pointSize: 24
                font.bold: true
            }
        }
        Row {
            id:bt
            anchors.bottom: bgr_rect.bottom
            anchors.left: bgr_rect.left
            anchors.bottomMargin: 200
            anchors.leftMargin: 320
        MyButton {
            id: divideButton
            operation: "/"
            onClicked: {
                result.text = parseFloat(argument1.text) / parseFloat(argument2.text);
            }
          }
        }

        Row {
            anchors.bottom: bgr_rect.bottom
            anchors.left: bgr_rect.left
            anchors.bottomMargin: 200
            anchors.leftMargin: 240
        MyButton {
            id: timeButton
         //  anchors.left: divideButton.right
            operation: "*"
            onClicked: {
                result.text = parseFloat(argument1.text) * parseFloat(argument2.text);
            }
          }
        }
        Row {
            anchors.bottom: bgr_rect.bottom
            anchors.left: bgr_rect.left
            anchors.bottomMargin: 200
            anchors.leftMargin: 80
        MyButton {
            id: plusButton
         //  anchors.left: divideButton.right
            operation: "+"
            onClicked: {
                result.text = parseFloat(argument1.text) + parseFloat(argument2.text);
            }
           }
        }

        Row {
            anchors.bottom: bgr_rect.bottom
            anchors.left: bgr_rect.left
            anchors.bottomMargin: 200
            anchors.leftMargin: 160
        MyButton {
            id: minusButton
         //  anchors.left: divideButton.right
            operation: "-"
            onClicked: {
                result.text = parseFloat(argument1.text) - parseFloat(argument2.text);
            }
        }
        }
    }
        Button {
            id: randomButton
            anchors.bottom:  bgr_rect.bottom
            anchors.topMargin: 10
            anchors.horizontalCenter: bgr_rect.horizontalCenter
            text: "Random"
            onClicked: {
                argument1.text = Math.floor(Math.random()*1000);
                argument2.text = Math.floor(Math.random()*1000);
            }
        }

        MessageDialog {
            id: messageDialog
            title: "May I have your attention please"
            text: "It's so cool that you are using Qt Quick."
            onAccepted: {
                console.log("And of course you could only agree.")
                Qt.quit()
            }
            Component.onCompleted: {
                    mouseArea.clicked.connect(Qtjs.func)
                }
        }

}


