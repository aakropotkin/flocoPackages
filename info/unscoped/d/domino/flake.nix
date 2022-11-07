{

  inputs.packument.url   = "https://registry.npmjs.org/domino?rev=69-520e686c6a0dfd2d29a0816085041c66";
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
    ident = "domino";
    ldir  = "info/unscoped/d/domino";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
