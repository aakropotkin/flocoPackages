{

  inputs.packument.url   = "https://registry.npmjs.org/levn?rev=23-02b68f7f301e36e1323e45c610acf84f";
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
    ident = "levn";
    ldir  = "info/unscoped/l/levn";
    inherit packument fetchInfo;
  } // latest';

}
