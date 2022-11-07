{

  inputs.packument.url   = "https://registry.npmjs.org/@webassemblyjs/helper-numbers?rev=5-b164fe2d39af594d1c6cb1ce9954b1a5";
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
    ident = "@webassemblyjs/helper-numbers";
    ldir  = "info/webassemblyjs/helper-numbers";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
