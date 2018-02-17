{
    "id": "1013b908-7f7a-4956-bd45-ab996faa5581",
    "modelName": "GMExtension",
    "mvc": "1.0",
    "name": "Keyboard",
    "IncludedResources": [
        "Sprites\\Keyboard_Examples\\gmkb_spr_pixel",
        "Scripts\\Keyboard_Examples\\example_textboxes\\gmkb_example_textbox_value_to_screen",
        "Scripts\\Keyboard_Examples\\example_advanced\\gmkb_example_input_set_active",
        "Scripts\\Keyboard_Examples\\example_advanced\\gmkb_example_input_set_cursor_position",
        "Scripts\\Keyboard_Examples\\example_advanced\\gmkb_example_input_refresh_text",
        "Scripts\\Keyboard_Examples\\example_advanced\\gmkb_example_input_refresh_cursor",
        "Scripts\\Keyboard_Examples\\example_advanced\\gmkb_example_input_refresh_view",
        "Scripts\\Keyboard_Examples\\example_advanced\\gmkb_example_input_get_line_width",
        "Fonts\\Keyboard_Examples\\gmkb_font_default",
        "Objects\\Keyboard_Examples\\example_basic\\gmkb_obj_example_basic",
        "Objects\\Keyboard_Examples\\example_textboxes\\gmkb_obj_example_textboxes",
        "Objects\\Keyboard_Examples\\example_textboxes\\gmkb_obj_textbox",
        "Objects\\Keyboard_Examples\\example_textboxes\\gmkb_obj_textbox_name",
        "Objects\\Keyboard_Examples\\example_textboxes\\gmkb_obj_textbox_number",
        "Objects\\Keyboard_Examples\\example_textboxes\\gmkb_obj_textbox_url",
        "Objects\\Keyboard_Examples\\example_textboxes\\gmkb_obj_textbox_email",
        "Objects\\Keyboard_Examples\\example_advanced\\gmkb_obj_example_advanced",
        "Objects\\Keyboard_Examples\\example_advanced\\gmkb_obj_input",
        "Objects\\Keyboard_Examples\\example_advanced\\gmkb_obj_input_textarea",
        "Objects\\Keyboard_Examples\\example_advanced\\gmkb_obj_input_name",
        "Objects\\Keyboard_Examples\\example_advanced\\gmkb_obj_input_description",
        "Rooms\\Keyboard_Examples\\gmkb_room_example_basic_phone",
        "Rooms\\Keyboard_Examples\\gmkb_room_example_basic_tablet",
        "Rooms\\Keyboard_Examples\\gmkb_room_example_textboxes_phone",
        "Rooms\\Keyboard_Examples\\gmkb_room_example_textboxes_tablet",
        "Rooms\\Keyboard_Examples\\gmkb_room_example_advanced_phone",
        "Rooms\\Keyboard_Examples\\gmkb_room_example_advanced_tablet"
    ],
    "androidPermissions": [
        
    ],
    "androidProps": true,
    "androidactivityinject": "",
    "androidclassname": "GMKeyboard",
    "androidinject": "",
    "androidmanifestinject": "",
    "androidsourcedir": "",
    "author": "",
    "classname": "GMKeyboard",
    "copyToTargets": 644907118,
    "date": "2018-58-15 07:02:57",
    "description": "",
    "extensionName": "",
    "files": [
        {
            "id": "312f153f-e173-4ca4-9a9d-8ee1b6770066",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                {
                    "id": "658c83b5-1615-40f8-86db-4013e731873a",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GMKB_TYPE_DEFAULT",
                    "hidden": false,
                    "value": "0"
                },
                {
                    "id": "f2bbe375-4245-45cd-b998-1f7fbd0b6785",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GMKB_TYPE_ASCII",
                    "hidden": false,
                    "value": "1"
                },
                {
                    "id": "59f81fc4-9588-4315-99e6-37e19d6e72d2",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GMKB_TYPE_NUMBERS",
                    "hidden": false,
                    "value": "2"
                },
                {
                    "id": "f937588e-3ba1-4650-bf61-914ae62f80e8",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GMKB_TYPE_URL",
                    "hidden": false,
                    "value": "3"
                },
                {
                    "id": "0fab94bb-5d64-49f0-8d0d-41b51804f6f6",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GMKB_TYPE_NUMBER_PAD",
                    "hidden": false,
                    "value": "4"
                },
                {
                    "id": "fc6991ec-d081-4da9-b286-01a048279b08",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GMKB_TYPE_PHONE_PAD",
                    "hidden": false,
                    "value": "5"
                },
                {
                    "id": "cfc7d816-7431-41c1-bfae-187d87540d7e",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GMKB_TYPE_NAME_PHONE_PAD",
                    "hidden": false,
                    "value": "6"
                },
                {
                    "id": "199dd736-1290-4a1e-bc01-355b8e1cef15",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GMKB_TYPE_EMAIL",
                    "hidden": false,
                    "value": "7"
                },
                {
                    "id": "bfaf959c-f0a8-4652-b122-bffd6147124d",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GMKB_TYPE_DECIMAL_PAD",
                    "hidden": false,
                    "value": "8"
                },
                {
                    "id": "ed16cf43-bfb3-4ea2-8553-75ace0961e0e",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GMKB_TYPE_TWITTER",
                    "hidden": false,
                    "value": "9"
                },
                {
                    "id": "09728f8d-6df7-4c80-8955-750360aaea40",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GMKB_TYPE_WEB_SEARCH",
                    "hidden": false,
                    "value": "10"
                },
                {
                    "id": "9e530f28-6115-40e6-b434-64837cdd742d",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GMKB_TYPE_DATETIME",
                    "hidden": false,
                    "value": "11"
                },
                {
                    "id": "fe0ef920-4c3f-4231-922a-213a69b60fc6",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GMKB_TYPE_PASSWORD",
                    "hidden": false,
                    "value": "12"
                },
                {
                    "id": "6ed22389-b9d4-4870-b8bd-99dc69ee7358",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GMKB_RK_TYPE_DEFAULT",
                    "hidden": false,
                    "value": "0"
                },
                {
                    "id": "898e7503-9b39-4fba-a504-2286a2e419a0",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GMKB_RK_TYPE_GO",
                    "hidden": false,
                    "value": "1"
                },
                {
                    "id": "f5a23fa0-4dd9-41b0-b0b6-e0531f426c70",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GMKB_RK_TYPE_GOOGLE",
                    "hidden": false,
                    "value": "2"
                },
                {
                    "id": "ea9d31ea-6ace-4d25-bb19-2496736d5430",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GMKB_RK_TYPE_JOIN",
                    "hidden": false,
                    "value": "3"
                },
                {
                    "id": "521cfdd2-76e6-4ccf-b853-c21e1f640aab",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GMKB_RK_TYPE_NEXT",
                    "hidden": false,
                    "value": "4"
                },
                {
                    "id": "f3d27b75-575c-4a81-a568-053c4b9e79b4",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GMKB_RK_TYPE_ROUTE",
                    "hidden": false,
                    "value": "5"
                },
                {
                    "id": "dc815c9d-b459-4ddf-ac5b-5aaea16b1bda",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GMKB_RK_TYPE_SEARCH",
                    "hidden": false,
                    "value": "6"
                },
                {
                    "id": "2b9a8f57-57d6-458c-a415-5d22e21670dd",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GMKB_RK_TYPE_SEND",
                    "hidden": false,
                    "value": "7"
                },
                {
                    "id": "853033ca-1f38-45b0-9268-2ccbd4bdcb5f",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GMKB_RK_TYPE_YAHOO",
                    "hidden": false,
                    "value": "8"
                },
                {
                    "id": "cc382876-e830-4b75-a93f-49715ddba398",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GMKB_RK_TYPE_DONE",
                    "hidden": false,
                    "value": "9"
                },
                {
                    "id": "ee43dfd1-b788-43e2-bc67-534f20637f85",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GMKB_APPEARANCE_LIGHT",
                    "hidden": false,
                    "value": "0"
                },
                {
                    "id": "7f787dbe-0730-46ab-8181-6bf673820006",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GMKB_APPEARANCE_DARK",
                    "hidden": false,
                    "value": "1"
                },
                {
                    "id": "bb691755-8060-4f33-8298-ff20a439c5e3",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GMKB_CAPITALIZE_SENTENCES",
                    "hidden": false,
                    "value": "0"
                },
                {
                    "id": "88dec9cc-a2ec-42bc-99ca-29abfee80a4d",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GMKB_CAPITALIZE_NONE",
                    "hidden": false,
                    "value": "1"
                },
                {
                    "id": "a40f3a6a-6f34-4a22-9888-d83ce815eaa6",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GMKB_CAPITALIZE_WORDS",
                    "hidden": false,
                    "value": "2"
                },
                {
                    "id": "b66e1c2c-7fdd-4269-827c-b716c0dd3f97",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GMKB_CAPITALIZE_ALL",
                    "hidden": false,
                    "value": "3"
                }
            ],
            "copyToTargets": 123146358329582,
            "filename": "gmkb_common.gml",
            "final": "",
            "functions": [
                {
                    "id": "5ca986cb-71c4-4488-8b80-f972a9eeabef",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "gmkb_init_common",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "gmkb_init_common",
                    "returnType": 2
                },
                {
                    "id": "baeaf9bc-ef6f-4aff-9735-7ef6d78d44ce",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        1,
                        2
                    ],
                    "externalName": "gmkb_char_get_sprite",
                    "help": "gmkb_char_get_sprite(char, font_size)",
                    "hidden": false,
                    "kind": 11,
                    "name": "gmkb_char_get_sprite",
                    "returnType": 2
                },
                {
                    "id": "18ec5ced-c665-4bd4-b6f9-eceddb44989d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 5,
                    "args": [
                        1,
                        2,
                        2,
                        2,
                        2
                    ],
                    "externalName": "gmkb_string_get_chars",
                    "help": "gmkb_string_get_chars(str, font, emoji_font_size, width, word_wrap)",
                    "hidden": false,
                    "kind": 11,
                    "name": "gmkb_string_get_chars",
                    "returnType": 2
                }
            ],
            "init": "gmkb_init_common",
            "kind": 2,
            "order": [
                
            ],
            "origname": "extensions\\gmkb_gml.gml",
            "uncompress": false
        },
        {
            "id": "5a3f4c59-680f-4545-8c62-99b0861d5909",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                
            ],
            "copyToTargets": 35651596,
            "filename": "gmkb_ios_android.ext",
            "final": "",
            "functions": [
                {
                    "id": "6a0d1e9f-e921-40f6-96b9-38cd9052fba1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "gmkb_init",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "gmkb_init",
                    "returnType": 2
                },
                {
                    "id": "7bd12160-3a47-4680-b047-00828bcdcb30",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "gmkb_show_keyboard",
                    "help": "gmkb_show_keyboard()",
                    "hidden": false,
                    "kind": 11,
                    "name": "gmkb_show_keyboard",
                    "returnType": 2
                },
                {
                    "id": "c35f10c1-a5a2-4ace-81ff-375b3273e640",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        2,
                        2
                    ],
                    "externalName": "gmkb_show_keyboard_type",
                    "help": "gmkb_show_keyboard_type(type, rk_type)",
                    "hidden": false,
                    "kind": 11,
                    "name": "gmkb_show_keyboard_type",
                    "returnType": 2
                },
                {
                    "id": "fc70685f-6f9a-48a6-a9e3-622fbfdca083",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 7,
                    "args": [
                        2,
                        2,
                        2,
                        2,
                        2,
                        2,
                        2
                    ],
                    "externalName": "gmkb_show_keyboard_ext",
                    "help": "gmkb_show_keyboard_ext(type, rk_type, appearance, capitalize, rk_disabled_until_input, rk_new_line, predictive)",
                    "hidden": false,
                    "kind": 11,
                    "name": "gmkb_show_keyboard_ext",
                    "returnType": 2
                },
                {
                    "id": "fa93ac4b-6daf-4e4b-8c27-75fc2f04c625",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "gmkb_hide_keyboard",
                    "help": "gmkb_hide_keyboard()",
                    "hidden": false,
                    "kind": 11,
                    "name": "gmkb_hide_keyboard",
                    "returnType": 2
                },
                {
                    "id": "c4558823-f3cd-4f26-8e36-870718d50285",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "gmkb_keyboard_is_visible",
                    "help": "gmkb_keyboard_is_visible()",
                    "hidden": false,
                    "kind": 11,
                    "name": "gmkb_keyboard_is_visible",
                    "returnType": 2
                },
                {
                    "id": "2dc9a63b-9237-4b3e-858b-2e39ef044a16",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "gmkb_keyboard_did_hide",
                    "help": "gmkb_keyboard_did_hide()",
                    "hidden": false,
                    "kind": 11,
                    "name": "gmkb_keyboard_did_hide",
                    "returnType": 2
                },
                {
                    "id": "f3e3c30b-2c85-4d93-8206-9c8bfb14253f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "gmkb_keyboard_get_height",
                    "help": "gmkb_keyboard_get_height()",
                    "hidden": false,
                    "kind": 11,
                    "name": "gmkb_keyboard_get_height",
                    "returnType": 2
                },
                {
                    "id": "f266e0e7-c242-4b43-90df-0b45418ee2b6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "gmkb_set_text",
                    "help": "gmkb_set_text(text)",
                    "hidden": false,
                    "kind": 11,
                    "name": "gmkb_set_text",
                    "returnType": 2
                },
                {
                    "id": "722b6ba1-3d8f-487f-92ec-b3eee27b3dc8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "gmkb_get_text",
                    "help": "gmkb_get_text()",
                    "hidden": false,
                    "kind": 11,
                    "name": "gmkb_get_text",
                    "returnType": 1
                },
                {
                    "id": "7f616956-2714-409a-962e-3858b8cbdca9",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "gmkb_get_last_char",
                    "help": "gmkb_get_last_char()",
                    "hidden": false,
                    "kind": 11,
                    "name": "gmkb_get_last_char",
                    "returnType": 1
                },
                {
                    "id": "19f6401c-630f-4f86-b0f1-3418b247494a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "gmkb_text_did_change",
                    "help": "gmkb_text_did_change()",
                    "hidden": false,
                    "kind": 11,
                    "name": "gmkb_text_did_change",
                    "returnType": 2
                },
                {
                    "id": "83e6763f-c81f-452a-9c66-bbcc2555e082",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "gmkb_key_was_pressed",
                    "help": "gmkb_key_was_pressed()",
                    "hidden": false,
                    "kind": 11,
                    "name": "gmkb_key_was_pressed",
                    "returnType": 2
                },
                {
                    "id": "74a9e187-57a7-43f8-838b-ad86470bdff8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "gmkb_return_key_was_pressed",
                    "help": "gmkb_return_key_was_pressed()",
                    "hidden": false,
                    "kind": 11,
                    "name": "gmkb_return_key_was_pressed",
                    "returnType": 2
                },
                {
                    "id": "dec8aad6-169f-4aba-8185-f9e01bcc9686",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "gmkb_backspace_key_was_pressed",
                    "help": "gmkb_backspace_key_was_pressed()",
                    "hidden": false,
                    "kind": 11,
                    "name": "gmkb_backspace_key_was_pressed",
                    "returnType": 2
                },
                {
                    "id": "f04a8a64-fee7-4510-a530-7367c61ec792",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "gmkb_language_disable",
                    "help": "gmkb_language_disable(language)",
                    "hidden": false,
                    "kind": 11,
                    "name": "gmkb_language_disable",
                    "returnType": 2
                },
                {
                    "id": "54d52206-f2e2-4885-bb68-4d0708ec49b9",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "gmkb_language_enable",
                    "help": "gmkb_language_enable(language)",
                    "hidden": false,
                    "kind": 11,
                    "name": "gmkb_language_enable",
                    "returnType": 2
                },
                {
                    "id": "f5f9bf62-6058-44d6-963c-d28bba58e210",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "gmkb_language_did_change",
                    "help": "gmkb_language_did_change()",
                    "hidden": false,
                    "kind": 11,
                    "name": "gmkb_language_did_change",
                    "returnType": 2
                },
                {
                    "id": "c7e01921-6048-4832-800a-09801520f8b8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "gmkb_get_language",
                    "help": "gmkb_get_language()",
                    "hidden": false,
                    "kind": 11,
                    "name": "gmkb_get_language",
                    "returnType": 1
                },
                {
                    "id": "31c20399-7870-4ee1-88d6-94aa5310b2c1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "gmkb_get_input_method",
                    "help": "gmkb_get_input_method()",
                    "hidden": false,
                    "kind": 11,
                    "name": "gmkb_get_input_method",
                    "returnType": 1
                },
                {
                    "id": "0f077a9a-3955-41a2-94ff-e8e06b78d6a9",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "gmkb_string_get_length",
                    "help": "gmkb_string_get_length(str)",
                    "hidden": false,
                    "kind": 11,
                    "name": "gmkb_string_get_length",
                    "returnType": 2
                },
                {
                    "id": "b390876a-3f45-411f-afde-cd18e92724ea",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        1,
                        2
                    ],
                    "externalName": "gmkb_string_char_at",
                    "help": "gmkb_string_char_at(str, index)",
                    "hidden": false,
                    "kind": 11,
                    "name": "gmkb_string_char_at",
                    "returnType": 1
                },
                {
                    "id": "f08dc092-3fed-4fa5-9f40-18f1f8e111ab",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 3,
                    "args": [
                        1,
                        2,
                        2
                    ],
                    "externalName": "gmkb_string_copy",
                    "help": "gmkb_string_copy(str, index, count)",
                    "hidden": false,
                    "kind": 11,
                    "name": "gmkb_string_copy",
                    "returnType": 1
                },
                {
                    "id": "c8096a42-6260-4ecf-a50a-1b795dc54fd7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "gmkb_char_is_emoji",
                    "help": "gmkb_char_is_emoji(char)",
                    "hidden": false,
                    "kind": 11,
                    "name": "gmkb_char_is_emoji",
                    "returnType": 2
                },
                {
                    "id": "01d421f3-4a87-4d44-820e-301d3e816e74",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        1,
                        2
                    ],
                    "externalName": "gmkb_char_get_image",
                    "help": "gmkb_char_get_image(char, font_size)",
                    "hidden": false,
                    "kind": 11,
                    "name": "gmkb_char_get_image",
                    "returnType": 1
                },
                {
                    "id": "9017900f-43b1-406f-a031-778c5d8668a6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "gmkb_clipboard_set",
                    "help": "gmkb_clipboard_set(text)",
                    "hidden": false,
                    "kind": 11,
                    "name": "gmkb_clipboard_set",
                    "returnType": 2
                },
                {
                    "id": "bdeae00e-6e32-42cb-9273-e33f8fc85456",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "gmkb_clipboard_get",
                    "help": "gmkb_clipboard_get()",
                    "hidden": false,
                    "kind": 11,
                    "name": "gmkb_clipboard_get",
                    "returnType": 1
                }
            ],
            "init": "gmkb_init",
            "kind": 4,
            "order": [
                
            ],
            "origname": "extensions\\gmkb_ios.ext",
            "uncompress": false
        },
        {
            "id": "ba74ee5e-da71-4578-9fb0-0fe93913640c",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                
            ],
            "copyToTargets": 123146322677986,
            "filename": "gmkb_other_targets.gml",
            "final": "",
            "functions": [
                {
                    "id": "8de5e822-a1c8-4371-a3be-a9bb9953e486",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "gmkb_init",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "gmkb_init",
                    "returnType": 2
                },
                {
                    "id": "ce2f9fba-fd01-4223-8d8a-909f4bee85da",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "gmkb_show_keyboard",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "gmkb_show_keyboard",
                    "returnType": 2
                },
                {
                    "id": "ed726c9e-257f-4014-b21b-a48267f190e8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        2,
                        2
                    ],
                    "externalName": "gmkb_show_keyboard_type",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "gmkb_show_keyboard_type",
                    "returnType": 2
                },
                {
                    "id": "25fe7613-b704-4bfe-b43d-d310f863d439",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 6,
                    "args": [
                        2,
                        2,
                        2,
                        2,
                        2,
                        2
                    ],
                    "externalName": "gmkb_show_keyboard_ext",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "gmkb_show_keyboard_ext",
                    "returnType": 2
                },
                {
                    "id": "f2bb114b-f459-47cc-a50c-3aeb24144f5d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "gmkb_hide_keyboard",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "gmkb_hide_keyboard",
                    "returnType": 2
                },
                {
                    "id": "a9aed244-d29f-4b7e-bd73-4cb20fde2bf5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "gmkb_keyboard_is_visible",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "gmkb_keyboard_is_visible",
                    "returnType": 2
                },
                {
                    "id": "dffda2ff-f868-452c-b986-a3b872ccc151",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "gmkb_keyboard_did_hide",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "gmkb_keyboard_did_hide",
                    "returnType": 2
                },
                {
                    "id": "c0d2a457-6acc-4c62-aabb-ea4c6b9c8ef1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "gmkb_keyboard_get_height",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "gmkb_keyboard_get_height",
                    "returnType": 2
                },
                {
                    "id": "9bbc2b67-6a17-4b4b-9ba8-8f7457a13077",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "gmkb_set_text",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "gmkb_set_text",
                    "returnType": 2
                },
                {
                    "id": "02eeb25b-73a2-42a6-9ab2-a86e8fc38ae3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "gmkb_get_text",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "gmkb_get_text",
                    "returnType": 1
                },
                {
                    "id": "ae9f36c5-7283-4b83-a267-e4182a48b709",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "gmkb_get_last_char",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "gmkb_get_last_char",
                    "returnType": 1
                },
                {
                    "id": "2f075c87-3eae-4ba2-af41-432d0fdddfff",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "gmkb_text_did_change",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "gmkb_text_did_change",
                    "returnType": 2
                },
                {
                    "id": "7f36f609-4383-4c01-bad5-8c8bae7bd841",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "gmkb_key_was_pressed",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "gmkb_key_was_pressed",
                    "returnType": 2
                },
                {
                    "id": "490f8368-2f7f-4647-8fbc-f419607d5106",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "gmkb_return_key_was_pressed",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "gmkb_return_key_was_pressed",
                    "returnType": 2
                },
                {
                    "id": "456389bf-64d4-410a-9384-efe5090d3bde",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "gmkb_backspace_key_was_pressed",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "gmkb_backspace_key_was_pressed",
                    "returnType": 2
                },
                {
                    "id": "fffa58b2-1e74-4ccd-a820-086f7572cd46",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "gmkb_language_disable",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "gmkb_language_disable",
                    "returnType": 2
                },
                {
                    "id": "3e9b543a-18be-4cff-8f90-a4db69914b0f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "gmkb_language_enable",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "gmkb_language_enable",
                    "returnType": 2
                },
                {
                    "id": "a912a950-3679-47c8-a233-97a106248b48",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "gmkb_language_did_change",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "gmkb_language_did_change",
                    "returnType": 2
                },
                {
                    "id": "22fded30-8574-4654-a3cc-574d53ccb81f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "gmkb_get_language",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "gmkb_get_language",
                    "returnType": 1
                },
                {
                    "id": "dc05d3c6-1427-4e98-9ff2-87dd50ea6539",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "gmkb_get_input_method",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "gmkb_get_input_method",
                    "returnType": 1
                },
                {
                    "id": "e6ff9c0a-2309-4491-918d-b053d429758a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "gmkb_string_get_length",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "gmkb_string_get_length",
                    "returnType": 2
                },
                {
                    "id": "ee648b52-752d-4d42-b7b3-aad78858a4cd",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        1,
                        2
                    ],
                    "externalName": "gmkb_string_char_at",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "gmkb_string_char_at",
                    "returnType": 1
                },
                {
                    "id": "9a69e109-8323-4368-8611-790edace6350",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 3,
                    "args": [
                        1,
                        2,
                        2
                    ],
                    "externalName": "gmkb_string_copy",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "gmkb_string_copy",
                    "returnType": 1
                },
                {
                    "id": "89e6673c-4bb8-4d7b-a4af-4d8ee055273a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "gmkb_char_is_emoji",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "gmkb_char_is_emoji",
                    "returnType": 2
                },
                {
                    "id": "858ae8a0-2e0b-4891-9751-679759b68e95",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        1,
                        2
                    ],
                    "externalName": "gmkb_char_get_image",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "gmkb_char_get_image",
                    "returnType": 1
                },
                {
                    "id": "9ecf7c23-5701-4f34-8b1e-3f2fded61694",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "gmkb_clipboard_set",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "gmkb_clipboard_set",
                    "returnType": 2
                },
                {
                    "id": "abe653b7-7d7e-4e77-9073-329c0f2d91d7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "gmkb_clipboard_get",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "gmkb_clipboard_get",
                    "returnType": 1
                }
            ],
            "init": "gmkb_init",
            "kind": 2,
            "order": [
                
            ],
            "origname": "extensions\\gmkb_other_exports.gml",
            "uncompress": false
        },
        {
            "id": "510b77f9-89e7-4514-a081-936d5f73d029",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                
            ],
            "copyToTargets": 0,
            "filename": "gmkb_doc.html",
            "final": "",
            "functions": [
                
            ],
            "init": "",
            "kind": 4,
            "order": [
                
            ],
            "origname": "extensions\\gmkb_doc.html",
            "uncompress": false
        }
    ],
    "gradleinject": "",
    "helpfile": "",
    "installdir": "",
    "iosProps": true,
    "iosSystemFrameworkEntries": [
        
    ],
    "iosThirdPartyFrameworkEntries": [
        
    ],
    "iosplistinject": "",
    "license": "$10 to buy",
    "maccompilerflags": "",
    "maclinkerflags": "",
    "macsourcedir": "",
    "packageID": "com.benetonsoftware.gmkb",
    "productID": "",
    "sourcedir": "",
    "version": "1.0.6"
}