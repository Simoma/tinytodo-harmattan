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


Page {
    id: page
    orientationLock: PageOrientation.LockPortrait
    tools: subPageTools
    signal newTodo(string name)

    ApplicationHeader {
        id: header
        title: "Add new todo"
    }

    Flickable {
        anchors.top: header.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        contentHeight: childrenRect.height

        Column {
            anchors.fill: parent
            anchors.margins: UiConstants.DefaultMargin
            spacing: UiConstants.DefaultMargin

            TextField {
                id: input
                width: parent.width
                anchors.margins: UiConstants.DefaultMargin
                //focus: true   // Doesn't set focus, instead makes focusing nearly impossible!?!
                placeholderText: "New todo title"
                text: ""
                Keys.onEnterPressed: {
                    console.log("Add: Enter pressed")
                    saveTodo();
                }
                Keys.onReturnPressed: {
                    console.log("Add: Return pressed")
                    saveTodo();
                }
            }

            Button {
                width: parent.width
                anchors.margins: UiConstants.DefaultMargin
                text: "Save"
                onClicked: {
                    console.log("Add: Save button clicked")
                    saveTodo();
                }
            }
        }
    }

    function saveTodo() {
        page.newTodo(input.text);
        input.text = "";
        pageStack.pop();
    }
}

