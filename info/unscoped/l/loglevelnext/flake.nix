{

  inputs.packument.url   = "https://registry.npmjs.org/loglevelnext?rev=22-b4a6a1ed462eead0e125681c52217804";
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
    ident = "loglevelnext";
    ldir  = "info/unscoped/l/loglevelnext";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
