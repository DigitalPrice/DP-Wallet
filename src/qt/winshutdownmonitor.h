// Copyright (c) 2014 The Bitcoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef KOMODO_QT_WINSHUTDOWNMONITOR_H
#define KOMODO_QT_WINSHUTDOWNMONITOR_H

#ifdef WIN32
#include <windef.h> // for HWND

#include <QByteArray>
#include <QString>
#include <QAbstractNativeEventFilter>

class WinShutdownMonitor : public QAbstractNativeEventFilter
{
public:
    /** Implements QAbstractNativeEventFilter interface for processing Windows messages */
    bool nativeEventFilter(const QByteArray &eventType, void *pMessage, long *pnResult);

    /** Register the reason for blocking shutdown on Windows to allow clean client exit */
    static void registerShutdownBlockReason(const QString& strReason, const HWND& mainWinId);
};

#endif

#endif // KOMODO_QT_WINSHUTDOWNMONITOR_H
