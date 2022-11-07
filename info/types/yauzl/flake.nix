{

  inputs.packument.url   = "https://registry.npmjs.org/@types/yauzl?rev=466-314fee252f0b4918ddcae980e4957a88";
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
    scope = "@types";
    ident = "@types/yauzl";
    ldir  = "info/types/yauzl";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
