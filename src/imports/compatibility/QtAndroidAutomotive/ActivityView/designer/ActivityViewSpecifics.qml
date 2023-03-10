/****************************************************************************
**
** Copyright (C) 2022 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of Qt Android Automotive compatibility.
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

import QtQuick
import QtQuick.Layouts
import HelperWidgets
import StudioTheme 1.0 as StudioTheme

//! [ActivityView compatibility]
Section {
    anchors.left: parent.left
    anchors.right: parent.right
    caption: qsTr("Activity View")

    SectionLayout {
        PropertyLabel { text: qsTr("Package name") }

        LineEdit {
            backendValue: backendValues.packageName
            Layout.fillWidth: true

        }

        PropertyLabel { text: qsTr("Class name") }

        LineEdit {
            backendValue: backendValues.className
            Layout.fillWidth: true
        }

        PropertyLabel { text: qsTr("Corner radius") }

        SecondColumnLayout {
            SpinBox {
                minimumValue: 0
                maximumValue: 128
                decimals: 0
                backendValue: backendValues.radius
                Layout.fillWidth: true
            }
        }
    }
}
//! [ActivityView compatibility]
