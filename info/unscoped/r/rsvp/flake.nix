{

  inputs.packument.url   = "https://registry.npmjs.org/rsvp?rev=144-5833a51b94a1fd630555433585b0960e";
  inputs.packument.flake = false;

  outputs = inputs: let
    importJSON = f: builtins.fromJSON ( builtins.readFile f );
    packument  = importJSON inputs.packument;
    fetchInfo  = if ! builtins.pathExists ./fetchInfo.json then {} else
                 importJSON ./fetchInfo.json;
    latest'    = if ! ( packument ? dist-tags.latest ) then {} else {
      latestVersion = packument.dist-tags.latest;
      latest        = packument.versions.${packument.dist-tags.latest};
    };
  in {
    scope = null;
    ident = "rsvp";
    ldir  = "info/unscoped/r/rsvp";
    inherit packument fetchInfo;
  } // latest';

}
