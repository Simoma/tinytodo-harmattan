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
    tools: subPageTools
    ApplicationHeader {
        id: header
        title: "About"
    }
    Flickable {
        anchors.top: header.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        contentHeight: childrenRect.height

        Column {
            id: column
            anchors.fill: parent
            anchors.margins: UiConstants.DefaultMargin
            spacing: UiConstants.DefaultMargin
            Label {
                anchors.horizontalCenter: column.horizontalCenter
                text: "Tiny Todo"
                font: UiConstants.TitleFont
            }
            Label {
                anchors.horizontalCenter: column.horizontalCenter
                text: "Version 0.0.1"
                font:  UiConstants.BodyTextFont
            }
            Label {
                anchors.horizontalCenter: column.horizontalCenter
                text: "Copyright 2013 Simo Mattila"
                font:  UiConstants.BodyTextFont
            }
            Label {
                anchors.horizontalCenter: column.horizontalCenter
                text: "simo.h.mattila@gmail.com"
                font: UiConstants.SubtitleFont
            }
            Label {
                anchors.horizontalCenter: column.horizontalCenter
                horizontalAlignment: Text.AlignHCenter
                text: "Distributed under the terms of the<br>GNU General Public License"
                font: UiConstants.SubtitleFont
            }
        }
    }
}
