{

  inputs.packument.url   = "https://registry.npmjs.org/@webassemblyjs/ieee754?rev=40-88fabcb2b3015de4d98fcfe44dd06c12";
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
    ident = "@webassemblyjs/ieee754";
    ldir  = "info/webassemblyjs/ieee754";
    inherit packument fetchInfo;
  } // latest';

}
