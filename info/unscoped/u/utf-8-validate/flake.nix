{

  inputs.packument.url   = "https://registry.npmjs.org/utf-8-validate?rev=41-6807fc7c8602af5d38dc6f881f54bf72";
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
    ident = "utf-8-validate";
    ldir  = "info/unscoped/u/utf-8-validate";
    inherit packument fetchInfo;
  } // latest';

}
