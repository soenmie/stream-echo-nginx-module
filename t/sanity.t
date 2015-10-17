# vi:set ft= ts=4 et:

use t::TestStream;

repeat_each(2);

plan tests => repeat_each() * (blocks() * 4);

run_tests;

__DATA__

=== TEST 1: simple single echo
--- stream_server_config
echo "Hello, stream echo!";

--- stream_response
Hello, stream echo!

--- no_error_log
[error]
[alert]



=== TEST 2: multiple echos
--- stream_server_config
echo Hi Kindy;
echo How is "going?";

--- stream_response
Hi Kindy
How is going?

--- no_error_log
[error]
[alert]



=== TEST 3: echo -n
--- stream_server_config
    echo -n "hello, ";
    echo 'world';

--- stream_response
hello, world

--- no_error_log
[error]
[alert]



=== TEST 4: echo without args
--- stream_server_config
    echo "hello";
    echo;
    echo 'world';

--- stream_response
hello

world

--- no_error_log
[error]
[alert]
