package com.redoverflow.haxebot;

import com.raidandfade.haxicord.types.structs.Presence;
import com.raidandfade.haxicord.types.Snowflake;
import com.raidandfade.haxicord.types.structs.Embed;
import com.raidandfade.haxicord.types.Message;
import com.raidandfade.haxicord.endpoints.Typedefs;
import com.raidandfade.haxicord.commands.CommandBot;
import Random;
import hx.strings.StringBuilder;
using StringTools;

class Main extends CommandBot {
    static function main() {
        new Main('',Main,'hx.');
    }

    @Command
    function help(message:Message) {
        /*var helpmsgc:String = "```\nHelp command\n\n\nhx.help\nSends this message.\n\nhx.say\nSends whatever was passed in the command.\n\nhx.info\nSends info about this bot.\n```";
        var helpmsg:MessageCreate = { content : helpmsgc };
        message.getChannel().sendMessage(helpmsg);*/
        var ef1:EmbedField = {
            _inline : false,
            name : "hx.help",
            value : "Sends this message."
        }
        var ef2:EmbedField = {
            _inline : false,
            name : "hx.say",
            value : "Sends whatever was passed in the command."
        }
        var ef3:EmbedField = {
            _inline : false,
            name : "hx.info",
            value : "Sends info about this bot."
        }
        var ef4:EmbedField = {
            _inline : false,
            name : "hx.amisus",
            value : "Tells you if you are sus or not."
        }
        var ef5:EmbedField = {
            _inline : false,
            name : "hx.ping",
            value : "Ping."
        }
        var ef6:EmbedField = {
            _inline : false,
            name : "hx.aboutme",
            value : "Outputs info about whoever used this command."
        }
        var eft:EmbedFooter = {
            text : "Bot by redoverflow#2763"
        }
        var embed:Embed = {
            title : "Help command",
            fields : [ef1,ef2,ef3,ef4,ef5,ef6],
            footer : eft
        }
        var helpmsg = {embed:embed}
        message.reply(helpmsg);
    }
    @Command
    function say(message:Message) {
        var saymsg:MessageCreate = { content : message.content.replace("hx.say ", "") }
        message.reply(saymsg);
    }
    @Command
    function info(message:Message) {
        var infomsgc:String = "This bot was made by **redoverflow** in Haxe, using **Haxicord**.";
        var infomsg:MessageCreate = { content : infomsgc };
        message.reply(infomsg);
    }
    @Command
    function amisus(message:Message) {
        switch (Random.bool()) {
            case true:
                message.react("✔️");
                var msg:MessageCreate = { content : "Yes, you are." };
                message.reply(msg);
            case false:
                message.react("❌");
                var msg:MessageCreate = { content : "Nah, you aren't." };
                message.reply(msg);
        }
    }
    @Command
    function ping(message:Message) {
        var pingmsg1 = new StringBuilder("<@");
        var pingmsgc:String = "";
        pingmsgc = pingmsg1.add(message.author.id.toString()).add(">").toString();
        var pingmsg:MessageCreate = { content : pingmsgc }
        message.reply(pingmsg);
    }
    @Command
    function aboutme(message:Message) {
        var un:String = message.author.username;
        var disc:String = message.author.discriminator;
        var aurl:String = message.author.avatarUrl;
        var id:Snowflake = message.author.id;
        var pr:Presence = message.author.presence;
        var ef1:EmbedField = {
            _inline: true,
            name: "Username",
            value: un+"#"+disc
        }
        var ef2:EmbedField = {
            _inline: true,
            name: "Avatar URL",
            value: aurl
        }
        var ef3:EmbedField = {
            _inline: true,
            name: "User ID",
            value: id.toString()
        }
        var ef4:EmbedField = {
            _inline: true,
            name: "Status",
            value: pr.status
        }
        var eft:EmbedFooter = {
            text: "Bot by redoverflow#2763"
        }
        var embed:Embed = {
            title: "About "+un,
            fields: [ef1,ef2,ef3,ef4],
            footer: eft
        }
        var msg:MessageCreate = { embed : embed }
        message.reply(msg);
    }
}