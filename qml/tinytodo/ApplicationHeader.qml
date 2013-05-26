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

Rectangle {
    property alias title: title.text

    color: "#1e87df"
    id: header
    height: UiConstants.HeaderDefaultHeightPortrait
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottomMargin: UiConstants.DefaultMargin
    z: 10

    Text {
        id: title
        anchors.fill: header
        anchors.topMargin: UiConstants.HeaderDefaultTopSpacingPortrait
        anchors.bottomMargin: UiConstants.HeaderDefaultBottomSpacingPortrait
        anchors.leftMargin: UiConstants.DefaultMargin
        font: UiConstants.HeaderFont
        color: "#FFFFFF"
        text: "Default header text"
    }
}
