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
    tools: listTools
    signal clearDoneTodos()
    signal addTodo()

    onClearDoneTodos: {
        console.log("List: Clear done todos");
        todoModel.clearDoneTodo();
    }

    onAddTodo: {
        console.log("List: Add new todo");
        pageStack.push(addPage);
    }

    AddPage {
            id: addPage
            onNewTodo: {
                if(name) {
                     console.log("List: new todo")
                     todoModel.addTodo(name)
                }
            }
        }

    TodoModel {
        id: todoModel
    }

    Component {
        id: todoDelegate
        CheckBox {
            height: UiConstants.ListItemHeightSmall
            text: name
            checked: done
            onCheckedChanged: {
                if(text) {
                    console.log("List: \"" + text + (checked ? "\" marked done":"\" marked not done"));
                    todoModel.updateStatus(text, checked);
                }
            }
        }
    }

    ApplicationHeader {
        id: header
        title: "Tiny Todo"
    }

    ListView {
        id: todoView
        model: todoModel
        delegate: todoDelegate
        anchors.top: header.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: UiConstants.DefaultMargin
        spacing: UiConstants.DefaultMargin

/*      ViewPlaceholder {   // TODO: Is there harmattan equivalent?
            enabled: todoView.count === 0
            text: "No items"
        }*/
    }
}
