{

  inputs.packument.url   = "https://registry.npmjs.org/babel-plugin-transform-object-rest-spread?rev=107-0c77c26feb0b93504e708b318831d3e9";
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
    ident = "babel-plugin-transform-object-rest-spread";
    ldir  = "info/unscoped/b/babel-plugin-transform-object-rest-spread";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
