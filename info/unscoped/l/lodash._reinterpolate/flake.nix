{

  inputs.packument.url   = "https://registry.npmjs.org/lodash._reinterpolate?rev=34-8bbdf873d28c91f9b04959646a2e856a";
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
    ident = "lodash._reinterpolate";
    ldir  = "info/unscoped/l/lodash._reinterpolate";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
