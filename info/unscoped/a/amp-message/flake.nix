{

  inputs.packument.url   = "https://registry.npmjs.org/amp-message?rev=14-b9d6f47f9110d72a484c51a876635dcb";
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
    ident = "amp-message";
    ldir  = "info/unscoped/a/amp-message";
    inherit packument fetchInfo;
  } // latest';

}
