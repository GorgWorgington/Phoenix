#ifndef METADATADATABASE_H
#define METADATADATABASE_H

#include "frontendcommon.h"
#include "phxpaths.h"
#include "logging.h"

#include <QMutex>

/*
 * All Database classes will folow this interface.
 * class Base
    {
    public:
        Base() = delete;

        static QSqlDatabase database() = 0;
        static void open() = 0;
        static void close() = 0;
        static void addDatabase() = 0;
        static void removeDatabase() = 0;
    };
 *
 */

namespace Library {

    class MetaDataDatabase {
        public:

            enum ThreadMode {
                NeedsMutex,
                NoMutex,
            };

            static const QString tableRoms;
            static const QString tableSystems;
            static const QString tableReleases;
            static const QString tableRegions;

            static QSqlDatabase database();
            static void open( const ThreadMode mode = NoMutex );
            static void close( const ThreadMode mode = NoMutex );
            static void addDatabase();
            static void removeDatabase();

            static QMutex mutex;



    };

}

#endif // METADATADATABASE_H
