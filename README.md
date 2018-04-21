[![Build Status](https://travis-ci.org/chmduquesne/wg-ip.svg?branch=master)](https://travis-ci.org/chmduquesne/wg-ip)

wg-ip is a tool to assign ip addresses derived from the public keys to
wireguard interfaces.

See https://lists.zx2c4.com/pipermail/wireguard/2018-April/002593.html

Usage
-----

    Usage: $1 [-4|-6|--subnet <subnet>] [gen <pubkey>|[dev <device> ]apply|[dev <device> ]dryrun]
    Subnet used:
        -4
            sets the subnet to $subnet4
        -6
            sets the subnet to $subnet6
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
    executed. Executing '$1' without argument is the same as running
    '$1 dryrun'
    Example:
        wg-ip dev wg0 apply
