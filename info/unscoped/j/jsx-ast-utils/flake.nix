{

  inputs.packument.url   = "https://registry.npmjs.org/jsx-ast-utils?rev=39-49e2aa0fe180287ae4a7ddeb587ea3b4";
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
    ident = "jsx-ast-utils";
    ldir  = "info/unscoped/j/jsx-ast-utils";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
