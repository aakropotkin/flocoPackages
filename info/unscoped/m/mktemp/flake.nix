{

  inputs.packument.url   = "https://registry.npmjs.org/mktemp?rev=26-0b24b6e1c2ad2a28957a17ef915120f3";
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
    ident = "mktemp";
    ldir  = "info/unscoped/m/mktemp";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
