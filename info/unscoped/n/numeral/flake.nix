{

  inputs.packument.url   = "https://registry.npmjs.org/numeral?rev=151-e2a86baf95f5d61f70e0ec13e0425e71";
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
    ident = "numeral";
    ldir  = "info/unscoped/n/numeral";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
