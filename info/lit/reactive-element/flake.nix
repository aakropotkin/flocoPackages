{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@lit/reactive-element?_rev=30-d406ee1ba1b3e67d03ac57840555d73b";
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
    scope = "@lit";
    ident = "@lit/reactive-element";
    ldir  = "info/lit/reactive-element";
    inherit packument fetchInfo;
  } // latest';

}
