{

  inputs.packument.url   = "https://registry.npmjs.org/range-parser?rev=40-493fd140f1375f7eb40e7f46ee46d363";
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
    ident = "range-parser";
    ldir  = "info/unscoped/r/range-parser";
    inherit packument fetchInfo;
  } // latest';

}
