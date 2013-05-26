/*
    Copyright 2013 Simo Mattila
    simo.h.mattila@gmail.com

    This file is part of Tiny Todo.

    Tiny Todo is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    any later version.

    Tiny Todo is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Tiny Todo.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 1.1
import com.nokia.meego 1.0

PageStackWindow {
    id: appWindow

    initialPage: listPage

    ListPage {
        id: listPage
    }

    ToolBarLayout {
        id: subPageTools
        visible: false
        ToolIcon {
                    platformIconId: "toolbar-back"
                    anchors.left: (parent === undefined) ? undefined : parent.left
                    onClicked: pageStack.pop()
                }
    }

    ToolBarLayout {
        id: listTools
        visible: true
        ToolIcon {
                    platformIconId: "toolbar-add"
                    anchors.left: (parent === undefined) ? undefined : parent.left
                    onClicked: listPage.addTodo()
                }
        ToolIcon {
            platformIconId: "toolbar-view-menu"
            anchors.right: (parent === undefined) ? undefined : parent.right
            onClicked: (myMenu.status === DialogStatus.Closed) ? myMenu.open() : myMenu.close()
        }
    }

    Menu {
        id: myMenu
        visualParent: pageStack
        MenuLayout {
            MenuItem {
                text: qsTr("About Tiny Todo")
                onClicked: pageStack.push(Qt.resolvedUrl("AboutPage.qml"))
            }
            MenuItem {
                text: qsTr("Delete done todos")
                onClicked: listPage.clearDoneTodos()
            }
        }
    }
}
