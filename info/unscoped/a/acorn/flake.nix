{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/acorn?_rev=204-ce9bcd21f1b99fed16566f9a9a114903";
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
    ident = "acorn";
    ldir  = "info/unscoped/a/acorn";
    inherit packument fetchInfo;
  } // latest';

}
