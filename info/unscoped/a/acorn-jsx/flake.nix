{

  inputs.packument.url   = "https://registry.npmjs.org/acorn-jsx?rev=67-3d3b5ccae6299e93fd618ddc0a11c4c0";
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
    ident = "acorn-jsx";
    ldir  = "info/unscoped/a/acorn-jsx";
    inherit packument fetchInfo;
  } // latest';

}
