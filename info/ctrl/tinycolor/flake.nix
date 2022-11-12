{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@ctrl%2ftinycolor?_rev=38-82ce05f717fde7f81601985ecf2ffb8c";
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
    scope = "@ctrl";
    ident = "@ctrl/tinycolor";
    ldir  = "info/ctrl/tinycolor";
    inherit packument fetchInfo;
  } // latest';

}
