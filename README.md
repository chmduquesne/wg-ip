[![Build Status](https://travis-ci.org/chmduquesne/wg-ip.svg?branch=master)](https://travis-ci.org/chmduquesne/wg-ip)

wg-ip is a tool to assign ip addresses derived from the public keys to
wireguard interfaces.

How to
------

I personally just run `wg-ip apply dev wg0` after adding the peers and
bringing the interface up. In my automation scripts, I obtain the private
ip address of a given node by using `wg-ip gen <node-pubkey>`.

Portability
-----------

wg-ip is written to be portable across shells. It should run fine on
openwrt (if not, it's a bug).

Advanced usage
--------------

    Usage: wg-ip [-4|-6|--subnet <subnet>][--asnet <length>] [gen <pubkey>|[dev <device> ]apply|[dev <device> ]dryrun]
    Subnet used:
        -4
            sets the subnet to 10.0.0.0/8
        -6
            sets the subnet to fd1a:6126:2887::/48
        --subnet <subnet>
            sets an arbitrary (ipv4 or ipv6) subnet
    When the subnet is specified several times, only the last
    occurrence applies. By default -6 is enabled.
    Device used:
        dev <device>:
            specify the device to which the commands apply.
        When the device option is used several times, only the last
        occurrence applies. If no device is specified, commands are
        applied to the first entry returned by 'wg show interfaces'
    Commands:
        --help
            show this message
        --test
            run the embedded test suite
        gen <pubkey>:
            generate an ip from the pubkey, in the specified subnet.
            when the --asnet option is used, the generated ip is cut to
            length to generate a subnet prefix instead of a whole ip.
        dryrun:
            generate an ip from the pubkey of the specified interface (see
            "device used"), as well as for all the peers of that same
            interface, in the specified subnet (see "subnet used"). Create
            commands to add this ip to the interface, as well as commands
            to modify allowed_ips for each peer. The commands are simply
            displayed, not applied.
        apply:
            actually run the commands displayed by 'dryrun'
    When several commands are specified, only the last one is
    executed. Executing '' without argument is the same as running
    ' dryrun'
    Example:
         dev wg0 apply

Original post
-------------

See https://lists.zx2c4.com/pipermail/wireguard/2018-April/002593.html
