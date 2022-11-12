{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/ansi-escapes?_rev=32-5702bdd0328c1d78958e65c5e328d218";
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
    ident = "ansi-escapes";
    ldir  = "info/unscoped/a/ansi-escapes";
    inherit packument fetchInfo;
  } // latest';

}
