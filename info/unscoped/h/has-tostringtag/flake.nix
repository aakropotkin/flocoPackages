{

  inputs.packument.url   = "https://registry.npmjs.org/has-tostringtag?rev=1-7200022bb2069a33a95e7b5c4fdc2113";
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
    ident = "has-tostringtag";
    ldir  = "info/unscoped/h/has-tostringtag";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
