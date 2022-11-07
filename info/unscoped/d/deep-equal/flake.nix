{

  inputs.packument.url   = "https://registry.npmjs.org/deep-equal?rev=69-0842d13d9e5e33f5a7993f8e6d405821";
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
    ident = "deep-equal";
    ldir  = "info/unscoped/d/deep-equal";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
