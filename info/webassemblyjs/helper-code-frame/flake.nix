{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@webassemblyjs/helper-code-frame?_rev=63-1f48d6806294180bc199134d559cddc6";
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
    scope = "@webassemblyjs";
    ident = "@webassemblyjs/helper-code-frame";
    ldir  = "info/webassemblyjs/helper-code-frame";
    inherit packument fetchInfo;
  } // latest';

}
