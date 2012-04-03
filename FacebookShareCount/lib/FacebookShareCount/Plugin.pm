package FacebookShareCount::Plugin;

use LWP::Simple;
use JSON qw( decode_json );

sub count_facebook_shares {
	my $mt = MT->instance;
	my $plugin = MT->component("FacebookShareCount");
	$iter = MT::Blog->load_iter();   
	while (my $blog = $iter->()) { 
		# For each of the blogs in the list, check if they have the 'check_fb_shares' plugin
		# setting checked or not
		my $scope = "blog:" . $blog->id;
		if ($plugin->get_config_value('count_fb_shares',$scope)){
			# If the blog has the 'count_fb_shares' option checked, loop over all entries and check them.
			$entriesiter = MT::Entry->load_iter({blog_id => $blog->id});
			while (my $entry = $entriesiter->()) {	
				my $fbresult = get("http://graph.facebook.com/?id=".$entry->permalink);
				my $decoded_json = decode_json( $fbresult );
				if ($decoded_json->{'shares'}){
					$entry->fbshares($decoded_json->{'shares'});
					$entry->save;
				}
			}
		}
	}
	
}

sub _hdlr_entryfbshares {
	my ($ctx, $args) = @_;
	
	my $entry = $ctx->stash('entry')
        || $ctx->error(MT->translate('You used an [_1] tag outside of the proper context.', 'EntryFBShares'));
        
        return $entry->fbshares;
}

1;
