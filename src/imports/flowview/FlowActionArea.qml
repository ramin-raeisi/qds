/****************************************************************************
**
** Copyright (C) 2020 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of Qt Quick Designer Components.
**
** $QT_BEGIN_LICENSE:GPL$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3 or (at your option) any later version
** approved by the KDE Free Qt Foundation. The licenses are as published by
** the Free Software Foundation and appearing in the file LICENSE.GPL3
** included in the packaging of this file. Please review the following
** information to ensure the GNU General Public License requirements will
** be met: https://www.gnu.org/licenses/gpl-3.0.html.
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.10
import QtQuick.Studio.EventSystem 1.0

MouseArea {
    width: 80
    height: 40

    id: root

    function trigger() {
        if (root.goBack) {
            print("go back")
            var par = root.parent
            while (parent) {
                if (parent.__isFlowView) {
                    parent.goBack()
                    return
                }
                parent = parent.parent
            }
        } else {
            target.trigger()
        }
    }

    property Connections connections : Connections {
        id: connections
    }

    property QtObject target

    enabled: target !== null || root.goBack

    onClicked: {
        root.trigger()
    }

    property bool goBack: false

    property alias eventIds: eventListener.eventIds

    function __receiveEvent(parameters) {
        var flowItem = root.parent
        var flow = flowItem.parent

        if (flow.currentItem !== flowItem)
            return;

        root.trigger()
    }

    EventListener {
        id: eventListener
        onTriggered: root.__receiveEvent(parameters)
    }
}

/*##^##
Designer {
    D{i:0;height:63;width:80}
}
##^##*/