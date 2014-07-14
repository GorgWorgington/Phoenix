import QtQuick 2.3
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1

TableView {
    id: table;

    property string itemName: "table";
    property string highlightColor: "#c3c3c3";
    property string textColor: "#f1f1f1";
    property string headerColor: "#4f474e";

    model: ListModel {
        ListElement {title: "Super Mario 64 (USA)"; console: "Nintendo 64"; playTime: "16.6 hrs"}
        ListElement {title: "Super Mario 64 (USA)"; console: "Nintendo 64"; playTime: "16.6 hrs"}
        ListElement {title: "Super Mario 64 (USA)"; console: "Nintendo 64"; playTime: "16.6 hrs"}
        ListElement {title: "Super Mario 64 (USA)"; console: "Nintendo 64"; playTime: "16.6 hrs"}
        ListElement {title: "Super Mario 64 (USA)"; console: "Nintendo 64"; playTime: "16.6 hrs"}
        ListElement {title: "Super Mario 64 (USA)"; console: "Nintendo 64"; playTime: "16.6 hrs"}
        ListElement {title: "Super Mario 64 (USA)"; console: "Nintendo 64"; playTime: "16.6 hrs"}
        ListElement {title: "Super Mario 64 (USA)"; console: "Nintendo 64"; playTime: "16.6 hrs"}
        ListElement {title: "Super Mario 64 (USA)"; console: "Nintendo 64"; playTime: "16.6 hrs"}
        ListElement {title: "Super Mario 64 (USA)"; console: "Nintendo 64"; playTime: "16.6 hrs"}
        ListElement {title: "Super Mario 64 (USA)"; console: "Nintendo 64"; playTime: "16.6 hrs"}

    }

    TableViewColumn{ role: "title"  ; title: "Name" ; width: 200 }
    TableViewColumn{ role: "console"  ; title: "Console" ; width: 100 }
    TableViewColumn{ role: "playTime"  ; title: "Play Time" ; width: 60; }

    ExclusiveGroup {
        id: rowGroup;
    }

    headerDelegate: Rectangle {
        color: table.headerColor;
        height: 25;
        width: parent.width;

        Label {
            text: styleData.value;
            anchors {
                left: parent.left;
                leftMargin: 15;
                verticalCenter: parent.verticalCenter;
            }
            color: table.textColor;

            font {
                bold: true;
                pixelSize: 12;
                family: "Sans";
            }

        }

    }

    style: TableViewStyle {
        id: tableStyle;

        frame: Rectangle {
            color: "#202020";
            width: 0;
        }

        rowDelegate: Rectangle {
            id: row;
            color: styleData.alternate ? "#171717" : "#0f0f0f";
            width: parent.width;
            height: 30;

            property ExclusiveGroup exclusiveGroup: rowGroup;
            property bool checked: false

            onExclusiveGroupChanged: {
                if (exclusiveGroup) {
                    exclusiveGroup.bindCheckable(row);
                }
            }

            onCheckedChanged: {
                if (checked) {
                    color = table.highlightColor;
                }
                else {
                    color = styleData.alternate ? "#171717" : "#0f0f0f";
                }
            }

            MouseArea {
                anchors.fill: parent;
                onPressed: row.checked = true;
            }

        }

        itemDelegate: Item {
            Label {
                anchors {
                    left: parent.left;
                    leftMargin: 15;
                    verticalCenter: parent.verticalCenter;
                }
                width: 175;
                color: "#f1f1f1";
                text: styleData.value;

                font {
                    bold: true;
                    pixelSize: 11;
                    family: "Sans";
                }

                elide: Text.ElideRight;

            }
        }
    }
}