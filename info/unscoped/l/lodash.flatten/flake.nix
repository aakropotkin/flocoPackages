{

  inputs.packument.url   = "https://registry.npmjs.org/lodash.flatten?rev=43-f9400847543dd548efc0f9f869c55b8f";
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
    ident = "lodash.flatten";
    ldir  = "info/unscoped/l/lodash.flatten";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
