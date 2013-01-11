// Default empty project template
#ifndef MindDrive_HPP_
#define MindDrive_HPP_

#include <QObject>

namespace bb { namespace cascades { class Application; }}

/*!
 * @brief Application pane object
 *
 *Use this object to create and init app UI, to create context objects, to register the new meta types etc.
 */
class MindDrive : public QObject
{
    Q_OBJECT
public:
    MindDrive(bb::cascades::Application *app);
    virtual ~MindDrive() {}
};


#endif /* MindDrive_HPP_ */
