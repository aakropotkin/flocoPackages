{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@fortawesome%2ffontawesome-free?_rev=76-96348f95a0d43cbe34cb296fdfcf2ebc";
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
    scope = "@fortawesome";
    ident = "@fortawesome/fontawesome-free";
    ldir  = "info/fortawesome/fontawesome-free";
    inherit packument fetchInfo;
  } // latest';

}
