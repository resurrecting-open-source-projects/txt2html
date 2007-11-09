# Test distribution before release
# Optional for end users if Test::Distribution not installed

use Test::More;

BEGIN {
    eval {
	require Test::Distribution;
    };
    if($@) {
	plan skip_all => "Test::Distribution not installed";
    }
    else {
	import Test::Distribution;
    }
}
