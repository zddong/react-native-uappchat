
import {
    NativeModules,
    Platform,
    DeviceEventEmitter
} from 'react-native';

const ChatModule = NativeModules.JGIMModule;


export default class UappChat {

    static PushChat() {
        // exec(null, null, PLUGIN_NAME, 'setDebugMode', [params])
        ChatModule.PushChat()

    }


}




