{

  inputs.packument.url   = "https://registry.npmjs.org/deep-eql?rev=33-0e59d52467c7f8cf7fd9ff69f7babb40";
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
    ident = "deep-eql";
    ldir  = "info/unscoped/d/deep-eql";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
