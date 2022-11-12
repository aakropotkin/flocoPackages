{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@fortawesome%2ffree-solid-svg-icons?_rev=78-55cfa9428bcd2058e270fc0c43819415";
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
    ident = "@fortawesome/free-solid-svg-icons";
    ldir  = "info/fortawesome/free-solid-svg-icons";
    inherit packument fetchInfo;
  } // latest';

}
